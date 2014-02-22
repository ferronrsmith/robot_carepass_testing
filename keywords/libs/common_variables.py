from config import *
import re

# default is to run locally
# environment = "qa2"

# CONSTANTS
DEFAULT_ENV = "{0}www.carepass.com"
DEFAULT_CONTEXT = "carepass{0}"
BROWSER = 'firefox'

# DEFAULT USERS
DEFAULT_USER_NAME = 'ferron.smith'
DEFAULT_USER_PASSWORD = 'Wizard12'
FF_PROFILE = 'profiles'
LOG_OUT_URL = 'https://{0}www.carepass/logout'

# DEFAULTS
ENVIRONMENT = 'carepass.com'
CONTEXT = 'carepass'

if environment.find('qa'):
    ENVIRONMENT = DEFAULT_ENV.format(environment)
    CONTEXT = DEFAULT_CONTEXT.format('')
    LOG_OUT_URL = LOG_OUT_URL.format(environment)
elif re.match(r'qa[2-9]', environment):
    ENVIRONMENT = DEFAULT_ENV.format(environment)
    if environment == 'qa2':
        CONTEXT = DEFAULT_CONTEXT.format('')
    else:
        CONTEXT = DEFAULT_CONTEXT.format(environment[-1:])
    LOG_OUT_URL = LOG_OUT_URL.format('qa2')
elif environment == "prod":
    ENVIRONMENT = 'carepass.com'
    CONTEXT = DEFAULT_CONTEXT.format('')
    LOG_OUT_URL = LOG_OUT_URL.format('')
    DEFAULT_USER_NAME = 'ferron.hanse'

SERVER = "{0}/{1}".format(ENVIRONMENT, CONTEXT)
CAREPASS_PATH = "https://{0}/".format(SERVER)
PHANTOMJS_REMOTE_URL = 'http://localhost:4444'
BROWSER_ALIAS = 'main browser'
DELAY = 0

# AUTH PAGES
LOGIN_URL = CAREPASS_PATH + "login"
LOG_OUT = CAREPASS_PATH + "logout"
REGISTRATION_URL = CAREPASS_PATH + "register"

WELCOME_URL = "https://{0}/".format(SERVER)

# APP MANAGEMENT PAGE
APP_URL = CAREPASS_PATH + "apps"
# e.g connecting jawbone :- /connect/provider?appToken=jawbone

APP_CONNECT_URL = CAREPASS_PATH + "connect/provider?appToken="
FITSYNC_CONNECT_URL = "https://app.fitsync.com/carepass"
APP_STORE_URL = CAREPASS_PATH + "appstore/"  #https://qa2www.carepass.com/appstore/22/download"


# USER PROFILE PAGE
BIOGRAPHY_URL = CAREPASS_PATH + "biography"


# GOAL URL
GET_STARTED_URL = CAREPASS_PATH + "getstarted"  # Getting started page
GET_STARTED_GOAL_URL = GET_STARTED_URL + "/goals"  # Goal selection page
GOAL_WIZARD_URL = GET_STARTED_GOAL_URL + "?goalTemplateId="  # Goal Wizard
GOAL_HISTORY_URL = CAREPASS_PATH + "goals/history"  # Goal history page
GOAL_TRACKER_URL = CAREPASS_PATH + "goals/?goal="  # Goal tracking page

# Virtual Run or Walk       1
# Fav Jeans                 2
# Kickstart Weight Loss     4
# Custom goal               9

# PROFILES
FITNESS_PROFILE = CAREPASS_PATH + "fitness/activity"
NUTRITION_PROFILE = CAREPASS_PATH + "nutrition"
DR_VISITS_PROFILE = CAREPASS_PATH + "drvisits"
INSURANCE_PROFILE = CAREPASS_PATH + "insurance"
MOOD_PROFILE = CAREPASS_PATH + "profiles/moods"
SLEEP_PROFILE = CAREPASS_PATH + "profiles/health/sleep"
MEDICATIONS_PROFILE = CAREPASS_PATH + "profiles/health/medications"
BODY_MEASUREMENT_PROFILE = CAREPASS_PATH + "profiles/health/bodymeasurements"
LAB_RESULTS_PROFILE = CAREPASS_PATH + "profiles/health/labresults"
CONDITIONS_PROFILE = CAREPASS_PATH + "profiles/health/conditions"
LIFESTYLE_PROFILE = CAREPASS_PATH + "lifestyle"

# STATIC PAGES
ITRIAGE_URL = CAREPASS_PATH + "apps/itriage"
HELP_URL = CAREPASS_PATH + "static-page/help"