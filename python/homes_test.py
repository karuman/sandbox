import mechanize
import re

from BeautifulSoup import BeautifulSoup

top_page = 'http://www.homes.co.jp/mansion/chuko/kanagawa/list/'


br = mechanize.Browser()
br.set_handle_robots(False)


br.open(top_page)
assert br.viewing_html()

html = br.response().read()

result_soup = BeautifulSoup(html)

found_divs = result_soup.findAll('div',{ "class" : "moduleInner" })
print "Found" + str(len(found_divs))
for d in found_divs:
    #print d
    bukkenName=d.find('span',{ "class" : "bukkenName" })
    #print bukkenName.string

    found_table=d.find('table',{ "class" : "verticalTable" })
    found_tr=found_table.findAll('tr')
    address=found_tr[0].find('td').text
    
    kouzo=found_tr[1].find('td').text
    found_td=found_tr[2].findAll('td')
    nensu=found_td[0].text
    kosu=found_td[1].text

    
    found_table=d.findAll('table',{ "class" : "unitSummary" })
    for table in found_table:
        found_tbody =table.findAll('tbody')
        for tbody in found_tbody:
            floar =tbody.find('td',{ "class" : "floar" })
            space =tbody.find('td',{ "class" : "space" })
            price =tbody.find('span',{ "class" : "num" })
            print bukkenName.string +"," + \
                price.string  +"," + \
                space.string  +"," + \
                floar.string  +"," + \
                address  +"," + \
                kouzo  +"," + \
                nensu  +"," + \
                kosu



#response = br.response()
#print response.geturl()
#print response.info()
#print response.read()
