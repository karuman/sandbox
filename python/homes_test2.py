import mechanize

from bs4 import BeautifulSoup

top_page = 'https://www.homes.co.jp/mansion/b-1083640007256/'


br = mechanize.Browser()
br.set_handle_robots(False)


br.open(top_page)
assert br.viewing_html()

html = br.response().read()

print html
#response = br.response()
#print response.geturl()
#print response.info()
#print response.read()
