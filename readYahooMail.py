import poplib
from email import parser

pop_conn = poplib.POP3_SSL('pop.mail.yahoo.com')
pop_conn.user('user@yahoo.com.mx')
pop_conn.pass_('xxxx')

#Get messages from server:
iMessageCount = len(pop_conn.list()[1])
messages = [pop_conn.retr(i) for i in range(1, iMessageCount + 1)]


# Concat message pieces:
messages = ["\n".join(mssg[1]) for mssg in messages]

#Parse message intom an email object:
messages = [parser.Parser().parsestr(mssg) for mssg in messages]
for message in messages:
    print message['subject']
