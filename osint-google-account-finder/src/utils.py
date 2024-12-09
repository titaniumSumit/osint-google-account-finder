import re

def validate_phone_number(phone_number):
    """Validates the phone number format."""
    return bool(re.match(r"^\+?[1-9]\d{1,14}$", phone_number))
