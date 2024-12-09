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
