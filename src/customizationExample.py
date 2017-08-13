from steem import Steem
s = Steem()
print("Ned " + s.get_account('ned')['sbd_balance'])
