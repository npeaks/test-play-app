
class UserCtrl

    constructor: (@$log, @$location, @UserService) ->
        @$log.debug "constructing UserController"
        @users = []
        @getAllUsers()

    getAllUsers: () ->
        @$log.debug "getAllUsers()"

        @UserService.listUsers()
        .then(
            (data) =>
                @$log.debug "Promise returned #{data.length} Users"
                @users = data
            ,
            (error) =>
                @$log.error "Unable to get Users: #{error}"
            )
    
    deleteUser: (firstName, lastName, user) ->
        @$log.debug "deleteUser()"

        @UserService.deleteUser(firstName, lastName, user)
        .then(
            (data) =>
                @$log.debug "Promise deleted user"
                @getAllUsers()
            ,
            (error) =>
                @$log.error "Unable to delete Users: #{error}"
            )

controllersModule.controller('UserCtrl', ['$log', '$location', 'UserService', UserCtrl])