from django.urls import path
from .views import HomePageView, FriendListView, FriendDetail,ProfileSettingsView, RewardView


urlpatterns = [
    path('home/<str:date>/', HomePageView.as_view()),
    path('social/', FriendListView.as_view()), #Working
    path('friend_detail/<int:friend_id>/',FriendDetail.as_view()), #Working
    path('rewards/', RewardView.as_view()),
]