from django.urls import path
from .views import *


urlpatterns = [
    path('home/<str:date_str>/', HomePageView.as_view()),
    path('friend_list/', FriendListView.as_view()), #Working
    path('friend_detail/<int:friend_id>/',UserDetail.as_view()), #Working
    path('rewards/', RewardView.as_view()), #Working
    path('users/login/', UserLoginView.as_view()), #Working
    path('create_goal/', CreateGoal.as_view()), #Working
    path('profile/', ProfileView.as_view()), #Working
    path('create_daily_progress/', create_daily_progress, name = 'create_daily_progress'), #Working
    path('personal_progress/', PersonalProgressListView.as_view()), #Working
    path('goal_detail/<int:goal_id>/', GoalDetailView.as_view()),
    path('social/search/', SearchView.as_view()), #Working
    path('reward_detail/<int:reward_id>/', UserRewardDetail.as_view()), #Working but for now not returning the goals associated
]