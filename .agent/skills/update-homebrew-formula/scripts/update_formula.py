import sys
import re
import json
import subprocess

def get_checksums(repo, version):
    try:
        # Get checksums.txt content
        result = subprocess.run(
            ["gh", "release", "view", version, "-R", repo, "--json", "assets", "--jq", '.assets[] | select(.name == "checksums.txt") | .url'],
            capture_output=True, text=True, check=True
        )
        url = result.stdout.strip()
        if not url:
            return None

        checksum_content = subprocess.run(["curl", "-L", url], capture_output=True, text=True, check=True).stdout

        checksums = {}
        for line in checksum_content.splitlines():
            parts = line.split()
            if len(parts) >= 2:
                hash_val, filename = parts[0], parts[1]
                checksums[filename] = hash_val
        return checksums
    except Exception as e:
        print(f"Error fetching checksums: {e}")
        return None

def update_formula(file_path, version, checksums):
    with open(file_path, 'r') as f:
        content = f.read()

    # Update version
    content = re.sub(r"version 'v?[\d.]+'", f"version '{version}'", content)

    # Update SHA256 hashes
    for filename, sha256 in checksums.items():
        # Match the URL line for this file and then find the next sha256 line
        # This handles the multi-platform structure of the formula
        pattern = rf'(url "https://github.com/.*?/{filename}")\n\s+sha256 \'[a-f0-9]+\''
        replacement = r"\1\n      sha256 '" + sha256 + "'"
        content = re.sub(pattern, replacement, content)

    with open(file_path, 'w') as f:
        f.write(content)

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python update_formula.py <formula_path> <repo> <version>")
        sys.exit(1)

    formula_path = sys.argv[1]
    repo = sys.argv[2]
    version = sys.argv[3]

    print(f"Updating {formula_path} for {repo} version {version}...")
    checksums = get_checksums(repo, version)
    if checksums:
        update_formula(formula_path, version, checksums)
        print("Successfully updated formula.")
    else:
        print("Failed to fetch checksums.")
        sys.exit(1)
