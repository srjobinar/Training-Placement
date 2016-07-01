'use strict ';

angular.module('tnpApp').factory('studentRegistration', function($http) {
    return {
        register: function(id) {
            return $http({
                url: 'http://localhost:3000/apply/' + id,
                method: 'POST',
                isArray: true,
            })
        },
        register: function(id) {
            return $http({
                url: 'http://localhost:3000/cancel/' + id,
                method: 'POST',
                isArray: true,
            })
        }
    }
});
