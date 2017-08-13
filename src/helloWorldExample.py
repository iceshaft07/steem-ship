from steem import Steem
s = Steem()
print(s.get_account('ned')['sbd_balance'])
