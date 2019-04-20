Keeping track of variables order:

Username
Bot_or_not (1 - yes, 0 - not)
Followers count
Friends count
Tweets count
Favorites count
Tweets_per_day ratio (Tweets count / Days since registration)
Follower-to-friend ratio (Followers count / Friends count)
Favorites-per-tweet ratio (Favorites count / Tweets count)

The training data will be the matrix starting from column 3:  5042x7
The response vector will be column 2: 5042x1

The dataset will be split into training matrix/response vector in Python
The features will be standardized in Python as well

NOTE: dataset_final is highly skewed into the bot binary class (4317 - yes, 725 - no).
Therefore, I generated another dataset "dataset_equal_class.csv" where binary classes representation is 50/50. 
