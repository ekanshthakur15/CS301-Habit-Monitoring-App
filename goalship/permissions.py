from rest_framework.permissions import BasePermission

class IsFriend(BasePermission):

    def has_object_permission(self, request, view, obj):
        user = request.user
        messgae = 'You must be friends with the person'
        if obj.profile.id in user.profile.friends.id:
            return obj