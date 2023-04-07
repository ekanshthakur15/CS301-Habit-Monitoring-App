from django.contrib import admin
from .models import Profile, Goal, DailyProgress, Reward, UserReward

# Register your models here.

admin.site.register(Profile)
admin.site.register(Goal)
admin.site.register(DailyProgress)
admin.site.register(Reward)
admin.site.register(UserReward)
