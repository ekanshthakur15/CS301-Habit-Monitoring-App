from django.db import models
from django.contrib.auth.models import User
from datetime import date

# Models/tables to store the data.

# Model to show users details

class Profile(models.Model):
    name = models.CharField(max_length= 30)
    user = models.OneToOneField(User, on_delete= models.CASCADE)
    age = models.PositiveIntegerField()
    image = models.IntegerField(blank= True, null= True)
    gender_choice = (
        ('Male', 'male'),
        ('female', 'Female'),
        ('others', 'Others'),
    )
    gender = models.CharField(max_length= 15, choices=gender_choice, default='others')
    friends = models.ManyToManyField('self', blank= True, symmetrical=True)

    def __str__(self) -> str:
        return self.name
    
# Model to show Goal details
class Goal(models.Model):
    name = models.CharField(max_length=20)
    user = models.ForeignKey(User, on_delete= models.CASCADE)
    image = models.IntegerField(default= 0)
    start_date = models.DateField(default= date.today, blank= True)
    duration = models.IntegerField(default= 7)
    progress = models.IntegerField(default= 1)
    progress_type = models.CharField(max_length=10,default='times')
    frequency = models.IntegerField( default=0)

    def __str__(self) -> str:
        return self.name
    
# Model to show daily progress of each goal   
class DailyProgress(models.Model):
    goal = models.ForeignKey(Goal,related_name='progess', on_delete=models.CASCADE)
    progress_date = models.DateField()
    progress_amount = models.IntegerField()

    def __str__(self) -> str: 
        return str(self.progress_date)

# Model to store Rewards Detail

class Reward(models.Model):
    name = models.CharField(max_length=50)
    image = models.IntegerField(default=0)
    description = models.CharField(max_length= 100)
    points_required = models.IntegerField()

    def __str__(self) -> str:
        return self.name

# Model to store the rewards earned by User

class UserReward(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    goal = models.ForeignKey(Goal, on_delete= models.CASCADE, blank=True, null= True)
    reward = models.ForeignKey(Reward, related_name='reward_of',on_delete= models.CASCADE)
    redeemed = models.BooleanField(default=False)

