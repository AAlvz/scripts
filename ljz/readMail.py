#!/usr/bin/python
# Handler for HTTP POST to http://myhost.com/messages for the route defined above
def on_incoming_message(request):
     if request.method == 'POST':
         sender    = request.POST.get('sender')
         recipient = request.POST.get('recipient')
         subject   = request.POST.get('subject', '')

         body_plain = request.POST.get('body-plain', '')
         body_without_quotes = request.POST.get('stripped-text', '')
         # note: other MIME headers are also posted here...

         # attachments:
         for key in request.FILES:
             file = request.FILES[key]
             # do something with the file

     # Returned text is ignored but HTTP status code matters:
     # Mailgun wants to see 2xx, otherwise it will make another attempt in 5 minutes
     return HttpResponse('OK')

def create_route():
    return requests.post(
        "https://api.mailgun.net/v2/routes",
        auth=("api", "key-7xua-ka1qyr34hi-6jyu6p1o2kvme9-7"),
        data=MultiDict([("priority", 1),
                        ("description", "Sample route"),
                        ("expression", "match_recipient('.*@samples.mailgun.org')"),
                        ("action", "forward('http://myhost.com/messages/')"),
                        ("action", "stop()")]))

def create_mailbox():
    return requests.post(
        "https://api.mailgun.net/v2/samples.mailgun.org/mailboxes",
        auth=("api", "key-7xua-ka1qyr34hi-6jyu6p1o2kvme9-7"),
        data={"mailbox": "alfonso@101project.mailgun.org",
              "password": "alfonsopass"})

def get_mailboxes():
    return requests.get(
        "https://api.mailgun.net/v2/samples.mailgun.org/mailboxes",
        auth=("api", "key-7xua-ka1qyr34hi-6jyu6p1o2kvme9-7"))

def get_routes():
    return requests.get(
        "https://api.mailgun.net/v2/routes",
        auth=("api", "key-7xua-ka1qyr34hi-6jyu6p1o2kvme9-7"),
        params={"skip": 1,
                "limit": 1})

print get_routes()
