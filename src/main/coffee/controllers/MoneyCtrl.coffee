app.controller('MoneyCtrl', ['$scope', 'calculatorService', ($scope, calculatorService) ->

  $scope.calculate = ->
    $scope.result = calculatorService.calculate($scope.amount, $scope.when, $scope.freq)

    ])