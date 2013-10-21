# TODO figure out how not to attatch this to the window object and still be able to access it from tests
window.dateUtils = {
  daysBetween: (from, to) ->
    DAY = 1000 * 60 * 60  * 24
    Math.round((Date.parse(to) - Date.parse(from)) / DAY)
}

