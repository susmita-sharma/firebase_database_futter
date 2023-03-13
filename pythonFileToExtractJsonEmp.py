

import json

from bs4 import BeautifulSoup

# read the file and parse the HTML code



with open('contact.html', 'r', errors='ignore') as f:
    html = f.read()
soup = BeautifulSoup(html, 'html.parser')

# find the <li> element that contains the name and phone number
li_list = soup.find_all('li')

# iterate over each <li> element and extract the name and phone number from it
for li in li_list:
    nameLi = li.span.text.strip()
    
    split_index1 = nameLi.find("(")
    split_index2 = nameLi.find(")")
    if split_index1 != -1:
    	name = nameLi[:split_index1].strip();
    	empID = nameLi[split_index1+1:split_index2].strip();
    	designation = nameLi[split_index2+1:-1].strip();
    else:
    	name = nameLi.strip();
    	designation = "";
    	empID = " ";


    

    # extract the phone number from the <small> tag
    small_tag = li.small
    if small_tag is None:
        phone = ''  # set phone number to an empty string if there's no <small> tag
    else:
        phone_tag = small_tag.find('a', href=lambda x: x and x.startswith('tel:'))
        if phone_tag is None:
            phone = ''  # set phone number to an empty string if there's no <a> tag with the phone number
        else:
            phone = phone_tag.text.strip()

    # print the results


    try:
    	intid = int(empID)

    	output_string = f'"name": "{name}","designation": "{designation}" , "id": "{intid}" , "phone": "{phone}"';
    	
    except ValueError:

        output_string = f'"name": "{name}" , "designation": "{empID}" , "id": "0000" , "phone": "{phone}" ';	
    
    	
    final = "{" + output_string + "}," ;
    
    
    
    with open('employee.json', 'a') as file:
        json.dump(final, file)
    
    print(final)
    




