def get_app_categories(dictionary):
    """
    Category of Applications
    :param dictionary:
    :return:
    """
    new_dict = {}
    for pair in dictionary.items():
        for key in pair[1]:
            if key not in new_dict.keys():
                new_dict[key] = []
            new_dict[key].append(pair[0])
    return new_dict


def get_apps_in_cat(dictionary, category, seq=1):
    """
    All applications in specific category
    :param dictionary:
    :param category:
    :param seq:
    :return:
    """
    if seq == 1:
        return get_app_categories(dictionary)[category]
    elif seq == 2:
        return dictionary[category]


def get_apps_in_cat_count(dictionary, category, seq=1):
    """
    Count of application in specific category
    :param dictionary:
    :param category:
    :param seq:
    :return:
    """
    return len(get_apps_in_cat(dictionary, category, seq))


# list of app categories on the App Manager Page
CATEGORIES = [
    'View All Apps'
]

# list of applications on the App Manager Page
APPS = {
    'ACTIVE Trainer': ['Fitness'],
    'BettrLife': ['Nutrition'],
    'BodyMedia': ['Body Measurement', 'Fitness', 'Nutrition', 'Sleep', 'Weight'],
    'Care4Today MHM': ['Medication'],
    'FatSecret': ['Body Measurement', 'Nutrition', 'Weight'],
    'Fitbit': ['Body Measurement', 'Fitness', 'Nutrition', 'Sleep', 'Weight'],
    'Fitbug': ['Body Measurement', 'Fitness', 'Nutrition', 'Weight'],
    'FitSync': ['Fitness'],
    'Fooducate': ['Body Measurement', 'Nutrition', 'Weight'],
    'Garmin Connect': [],
    'iTriage': ['Dr. Visit'],
    'Lose It!': ['Body Measurement', 'Nutrition', 'Weight'],
    'MapMyFitness': ['Fitness'],
    'meQ': ['Mood'],
    'Moves': ['Fitness'],
    'MOXIEfit': ['Body Measurement', 'Fitness', 'Weight'],
    'MyBreath Lite': ['Body Measurement'],
    'Passage': ['Fitness'],
    'RunKeeper': ['Fitness'],
    'SparkPeople': ['Fitness', 'Nutrition'],
    'Thryve': ['Nutrition'],
    'UP': ['Body Measurement', 'Fitness', 'Nutrition', 'Sleep', 'Weight'],
    'WellZone': ['Body Measurement', 'Fitness', 'Lifestyle', 'Nutrition', 'Weight'],
    'Withings': ['Body Measurement'],
    'Zipongo': ['Nutrition']
}

# cache categories and their respective apps
ALL_CATEGORIES = get_app_categories(APPS)

# expand categories with apps
CATEGORIES += sorted(ALL_CATEGORIES.keys(), key=str.lower)

#count of drop-down categories on the App Manager page
CAT_COUNT = len(CATEGORIES)

# list of apps
APP_LISTING = APPS.keys()

# count of applications in CarePass
APPL_COUNT = len(APP_LISTING)

# default list of app count
APP_COUNT = {
    'View All Apps': APPL_COUNT
}

# dynamically generate app count
for catz in ALL_CATEGORIES.keys():
    APP_COUNT[catz] = get_apps_in_cat_count(ALL_CATEGORIES, catz, 2)
