API_KEY = 'AIzaSyAPiyra7RLtlAb4TwqyBPjnaaaHNDgQ-i8'
CALENDAR_ID = 'ja.japanese#holiday@group.v.calendar.google.com'

#call API
from apiclient.discovery import build
service = build(serviceName='calendar', version='v3', developerKey=API_KEY)
events = service.events().list(calendarId=CALENDAR_ID).execute()

# Display results
for item in events['items']:
  print( u'{0}\t{1}'.format( item['start']['date'], item['summary'] ) )

# Display results with sort
for item in sorted(events['items'], key=lambda item: item['start']['date']):
  print( u'{0}\t{1}'.format( item['start']['date'], item['summary'] ) )
