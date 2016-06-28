'use strict';

angular.module('tnpApp')
    .controller('UserIndexCtrl', function($scope, $mdDialog, companyList) {

      // Throw this into an init?

      companyList.getCompany().success(function(response) {
          $scope.available = response[0];
      });

      $scope.cType = "avail";
      $scope.message = "you can apply for";
      $scope.action_name = "Register";

      $scope.selected_company = {
        name : "Company Something",
        job_desc : "There will be some logic to selecting this..."
      }

      $scope.companyType = function(cType) {
        if (cType == 0) {
          $scope.cType = "avail";
          $scope.message = "you can apply for";
          $scope.action_name = "Register";
        } else if (cType == 1) {
          $scope.cType = "prog";
          $scope.message = "you have been registered to appear for";
          $scope.action_name = "Check Status";
        } else if (cType == 2) {
          $scope.cType = "comp";
          $scope.message = "have completed their procedure";
          $scope.action_name = "View Results";
        }
      }

      $scope.selectCompany = function(index) {
          $scope.selected_company = $scope.companies[index];
      }

      $scope.register = function() {

         var confirm = $mdDialog.prompt()
            .title('What would you name your zone?')
            .textContent('Bowser is a common name.')
            .placeholder('Zone name')
            .ariaLabel('Zone Name')
            .initialValue('New Zone')
            .targetEvent(ev)
            .ok('Okay!')
            .cancel('Cancel');

          $mdDialog.show(confirm).then(function(result) {


          }, function() {

          });


      }


});
