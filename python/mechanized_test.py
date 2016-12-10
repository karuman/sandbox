import mechanize

import BeautifulSoup

top_page = 'https://161.202.151.198/trac/SDP/report/1'

top_page ='https://161.202.151.198/trac/SDP/query?owner=jl26165&status=opened&status=reopened&status=review1&status=review2&status=review3&keywords=!~[working]&keywords=!~[blocking]&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=customer&order=priority'
username = "my user name"
password = "my password"

br = mechanize.Browser()
br.set_handle_robots(False)
br.add_password(top_page, 'jl26165', '8ui9jnmk')

response =br.open(top_page)
#response = br.response()
print response.geturl()
print response.info()
print response.read()
