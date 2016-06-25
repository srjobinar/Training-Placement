'use strict';

angular.module('tnpApp')
    .controller('UserIndexCtrl', function($scope, companyList) {

      companyList.getCompany().success(function(response) {
          $scope.companies = response;
      });

      $scope.companyType = function(cType) {
        if (cType == 0) {
          $scope.message = "you can apply for";
          $scope.action_name
        } else if (cType == 1) {
          $scope.message = "you have been registered to appear for";
        } else if (cType == 2) {
          $scope.message = "have completed their procedure";
        }
      }


});
