'use strict';

angular.module('tnpApp')
    .controller('UserIndexCtrl', function($scope, $mdDialog, companyList, studentRegistration) {

      // Throw this into an init?

      var companies;

      $scope.init = function() {

        $scope.cType = "AVAILABLE";
        $scope.message = "you can apply for";
        $scope.action_name = "Register";

        companyList.getCompany().success(function(response) {
            companies = response;
            console.log(response);
            $scope.companies = companies[0];
            $scope.selected_company = $scope.companies[0];
            $scope.no_companies = $scope.companies.length == 0;
        });
      }

      $scope.init();

      $scope.companyType = function(cType) {
        if (cType == 0) {
          $scope.cType = "AVAILABLE";
          $scope.message = "you can apply for";
          $scope.action_name = "Register";
          $scope.companies = companies[0];
          $scope.no_companies = $scope.companies.length == 0;
          $scope.selected_company = $scope.companies[0];
        } else if (cType == 1) {
          $scope.cType = "APPLIED";
          $scope.message = "you have been registered to appear for";
          $scope.action_name = "Cancel";
          $scope.companies = companies[1];
          $scope.no_companies = $scope.companies.length == 0;
          $scope.selected_company = $scope.companies[0];
        } else if (cType == 2) {
          $scope.cType = "REGISTERED";
          $scope.message = "have completed their procedure";
          $scope.action_name = "View List";
          $scope.companies = companies[2];
          $scope.no_companies = $scope.companies.length == 0;
          $scope.selected_company = $scope.companies[0];
        }
      }

      $scope.selectCompany = function(index) {
          $scope.selected_company = $scope.companies[index];
      }

      $scope.register = function(ev, name, id) {

        var confirm = $mdDialog.confirm()
             .title('Would you like to apply for ' + name + '?' )
             .textContent('Your application will be reviewed by the admin.')
             .ariaLabel('Register Button')
             .targetEvent(ev)
             .ok('Yes')
             .cancel('No');

        $mdDialog.show(confirm).then(function() {
          studentRegistration.register(id).success(function(response) {
            $scope.init();
          }).error(function(error) {
          })
        }, function() {

        });

      }

      $scope.cancel = function(ev, name, id) {

        var confirm = $mdDialog.confirm()
             .title('Do you wish to cancel your application for ' + name + '?' )
             .textContent('Your application will be removed.')
             .ariaLabel('Cancel Button')
             .targetEvent(ev)
             .ok('Yes')
             .cancel('No');

        $mdDialog.show(confirm).then(function() {
          studentRegistration.cancel(id).success(function(response) {
            $scope.init();
          }).error(function(error) {
          })
        }, function() {

        });

      }


});
