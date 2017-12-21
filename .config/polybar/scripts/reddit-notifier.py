
from configparser import ConfigParser
import praw
import time
from win10toast import ToastNotifier


if __name__ == "__main__":
    cfg = ConfigParser()

    cfg.read('config.ini')
    USER_AGENT = cfg.get('auth', 'user_agent')
    CLIENT_ID = cfg.get('auth', 'client_id')
    CLIENT_SECRET = cfg.get('auth', 'client_secret')

    SUBREDDIT = cfg.get('preferences', 'subreddit')
    SLEEP_TIME = int(cfg.get('preferences', 'sleep_time'))


reddit = praw.Reddit(user_agent = USER_AGENT, client_id = CLIENT_ID, client_secret = CLIENT_SECRET)
cache = []
toaster = ToastNotifier()
didFirstRun = False

def run_bot():
    subreddit = reddit.subreddit(SUBREDDIT)
    for submission in subreddit.stream.submissions():
    	if submission.id not in cache:
            print(submission.subreddit, "|", submission.title)
            if didFirstRun:
                toaster.show_toast("New post on " + submission.subreddit, submission.title)
            cache.append(submission.id)


while True:
	run_bot()
	didFirstRun = True
	time.sleep(SLEEP_TIME)
