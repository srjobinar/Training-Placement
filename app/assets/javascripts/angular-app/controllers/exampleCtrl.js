'use strict';

angular.module('tnpApp')
    .controller('ExampleCtrl', function($scope, companyList) {

      companyList.getCompany().success(function(response) {
          $scope.companies = response;
      });
});
