'use strict ';

angular.module('tnpApp').factory('companyList', function($http) {
    return {
        getCompany: function() {
          return $http({
              url: 'http://localhost:3000/company_list',
              method: 'GET',
              isArray: true,
          })
        },
        getCompanyByBranch: function () {
          return $http({
              url: 'http://localhost:3000/company_by_branch',
              method: 'GET',
              isArray: true,
          })
        }
    }
});
