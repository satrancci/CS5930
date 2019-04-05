# This script was adapted from the following repository by @Fujman12: https://github.com/Fujman12/twitter_scraper

CONSUMER_KEY=""
CONSUMER_SECRET=""
ACCESS_TOKEN=""
ACCESS_TOKEN_SECRET=""


import tweepy
import time
import sys


from openpyxl import Workbook


def write_to_sheet(name, number_of_followers, number_following, location, description, created_at, statuses_count, favourites_count, default_profile, default_profile_image):
    global row_count

    ws1["A%d" % row_count] = name
    ws1["B%d" % row_count] = number_of_followers
    ws1["C%d" % row_count] = number_following
    ws1["D%d" % row_count] = location
    #Link
    ws1["E%d" % row_count] = "https://twitter.com/%s" % name
    ws1["F%d" % row_count] = description
    ws1["G%d" % row_count] = created_at
    ws1["H%d" % row_count] = statuses_count
    ws1["I%d" % row_count] = favourites_count
    ws1["J%d" % row_count] = default_profile
    ws1["K%d" % row_count] = default_profile_image


    wb.save("FILENAME.xlsx")
    row_count += 1


auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

api = tweepy.API(auth)

followers = []

user = tweepy.Cursor(api.followers, screen_name="TWITTER_USERNAME").items()

row_count = 56000
wb = Workbook()
ws1 = wb.active

ws1["A1"] = 'Twitter handle/screen name'
ws1["B1"] = 'Number of followers'
ws1["C1"] = 'Number following'
ws1["D1"] = 'Location'
ws1["E1"] = "Link"
ws1["F1"] = "Description"
ws1["G1"] = "Created_At"
ws1["H1"] = "Statuses_Count"
ws1["I1"] = "Favourites_Count"
ws1["J1"] = "Default_Profile"
ws1["K1"] = "Default_Profile_Image"


wb.save("FILENAME.xlsx")

u = next(user)
print("Adding %s to sheet" % u.screen_name)

while True:
    try:
        u = next(user)
        print("Adding %s to sheet" % u.screen_name)
        write_to_sheet(u.screen_name, u.followers_count, u.friends_count, u.location, u.description, u.created_at, u.statuses_count, u.favourites_count, u.default_profile, u.default_profile_image)

    except:
        e = sys.exc_info()[0]
        print (e)
        print('We got a timeout ... Sleeping for 15 minutes')
        time.sleep(15*60)

