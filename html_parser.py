from bs4 import BeautifulSoup
import os
import pandas as pd

HTML_FOLDER = 'yeet/'
file_names = os.listdir(HTML_FOLDER)
final_list = []  # TODO: find some other solution other than a global variable


def extract_data(soup):
    '''
    Function that takes in a single HTML file and returns a DataFrame with the required data
    :param soup:
    '''
    global final_list
    for company in soup.div.children:
        if company['class'] != ['ad_campaign_search']:  # A div in the list is not a company. Something related to ads.
            # We'll skip that div
            company_name = company.contents[0].div.string
            as_code = company.contents[0]['href'][1:]
            as_site = "https://www.agencyspotter.com/" + as_code
            # company_site = company.contents[1].div.contents[1].a['href']
            company_employees = company.contents[2].div.div.contents[1].lstrip()
            company_location = company.contents[3].string
            company_id = company.contents[3]['data-id']

            company_row = [company_id, company_name, company_employees, company_location, as_site, as_code]  # single row of data
            final_list.append(company_row)  # at the end of the loop, we'll have all agencies info from a single HTML page

# final_list = pd.DataFrame()


for file in file_names:
    with open(HTML_FOLDER + file) as fp:
        soup = BeautifulSoup(fp, "lxml")
        print("Parsing " + file)
        extract_data(soup)
headings = ['id', 'name', 'employee strength', 'location', 'agency spotter website', 'agency spotter code']


df = pd.DataFrame(final_list, columns=headings)
with open('results.csv', mode='w', newline='') as fn:
    df.to_csv(fn, quotechar='"')

'''
#company name
print(main_soup.div.contents[0].contents[0].div.string)

#number of employees, note leading space
print(main_soup.div.contents[0].contents[2].div.div.contents[1])

#company id
print(main_soup.div.contents[0].contents[3]['data-id'])

Sample data:








'''