from django.db import models
from django.contrib.auth.models import User
from datetime import date

# Models/tables to store the data.

# Model to show users details

class Profile(models.Model):
    name = models.CharField(max_length= 30)
    user = models.OneToOneField(User, on_delete= models.CASCADE)
    email = models.EmailField(unique= True)
    age = models.PositiveIntegerField()
    image = models.ImageField(upload_to='profle_image', blank= True)
    gender_choice = (
        ('Male', 'male'),
        ('female', 'Female'),
        ('others', 'Others'),
    )
    gender = models.CharField(max_length= 15, choices=gender_choice, default='others')

    def __str__(self) -> str:
        return self.name
    
# Model to show friends
class Friends(models.Model):
    user = models.ForeignKey(User ,on_delete=models.CASCADE, related_name="friend")
    friend =models.ForeignKey(User, on_delete=models.CASCADE, related_name="friend_of")

# Model to show Goal details

class Goal(models.Model):
    name = models.CharField(max_length=20)
    user = models.ForeignKey(User, on_delete= models.CASCADE)
    start_date = models.DateField(default= date.today)
    duration = models.IntegerField(default= 7)
    progress_choice = (
        ('Seconds', 'seconds'),
        ('minutes', 'Minutes'),
        ('Hours','hours'),
        ('Meters', 'meters'),
        ('kilometers', 'Kilometer'),
        ('steps', 'Steps'),
        ('times', 'Times')
    )
    progress = models.IntegerField(default= 0)
    progress_type = models.CharField(max_length=10, choices= progress_choice, default='times')
    frequency = models.IntegerField( default=0)

    def __str__(self) -> str:
        return self.name
    
# Model to show daily progress of each goal   
class DailyProgress(models.Model):
    goal = models.ForeignKey(Goal, on_delete=models.CASCADE)
    progress_date = models.DateField()
    progress_amount = models.IntegerField()

# Model to store Rewards Detail

class Reward(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length= 100)
    points_required = models.IntegerField()

    def __str__(self) -> str:
        return self.name
# Model to store the rewards earned by User

class UserReward(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    reward = models.ForeignKey(Reward, on_delete= models.CASCADE)
    redeemed = models.BooleanField(default=False)
