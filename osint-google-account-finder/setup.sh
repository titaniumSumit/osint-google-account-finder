#!/bin/bash
# setup.sh - Automated Setup and Execution for OSINT Google Account Finder

echo "[*] Starting automated setup..."

# Step 1: Install Python3 if not installed
if ! [ -x "$(command -v python3)" ]; then
    echo "Error: Python3 is not installed. Please install Python3 and retry." >&2
    exit 1
fi

# Step 2: Set up virtual environment
if [ ! -d "venv" ]; then
    echo "[*] Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Step 3: Install dependencies
echo "[*] Installing dependencies..."
pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "Error: requirements.txt not found. Ensure dependencies are listed." >&2
    exit 1
fi

# Step 4: Run the tool
echo "[*] Setup complete."
echo "[*] Starting OSINT Google Account Finder tool..."
python3 - <<'EOF'
from scraper import find_google_account

def main():
    print("[*] OSINT Google Account Finder")
    phone_number = input("Enter the phone number: ")
    result = find_google_account(phone_number)
    if result:
        print(f"[+] Google Account Found: {result}")
    else:
        print("[-] No Google Account Found.")

if __name__ == "__main__":
    main()
EOF
