from django.urls import path
from .views import *


urlpatterns = [
    path('home/<str:date>/', HomePageView.as_view()),
    path('social/', FriendListView.as_view()), #Working
    path('friend_detail/<int:friend_id>/',UserDetail.as_view()), #Working
    path('rewards/', RewardView.as_view()), #Working
    path('users/login/', UserLoginView.as_view()), #Working
    path('create_goal/', CreateGoal.as_view()), #Working
    path('profile/', ProfileView.as_view()), #Working
    path('create_daily_progress/', create_daily_progress, name = 'create_daily_progress'), #Working
    path('personal_progress/', PersonalProgressListView.as_view()), #Working
    path('personal_progress/<int:goal_id>/',PersonalProgressListView.as_view()),
    path('social/search/', SearchView.as_view()), #Working
]