 bool vehicleNumberValidation(number) {
    // Pattern pattern = ^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$;
    String pattern = r"^[A-Z]{2}\s[0-9]{2}\s[A-Z]{2}\s[0-9]{4}$";
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(number);
  }

  bool rcNumberValidation(number){
    String pattern ="^(([A-Z]{2}[0-9]{2})"
                       + "( )|([A-Z]{2}-[0-9]"
                       + "{2}))((19|20)[0-9]"
                       + "[0-9])[0-9]{7}";
                       RegExp regExp = new RegExp(pattern);
                       return regExp.hasMatch(number);
  }
