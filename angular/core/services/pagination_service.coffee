angular.module('loomioApp').factory 'PaginationService', (AppConfig) ->
  new class PaginationService

    windowFor: ({current, min, max, pageType}) ->
      pageSize = AppConfig.pageSize[pageType] or AppConfig.pageSize.default
      {
        prev: _.max [current - pageSize, min] if current > min
        next: current + pageSize              if current + pageSize < max
        pageSize: pageSize
      }
