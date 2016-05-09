###
# Copyright (C) 2014-2015 Taiga Agile LLC <taiga@taiga.io>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: history.controller.coffee
###

module = angular.module("taigaHistory")

class HistorySectionController
    @.$inject = [
        "$tgResources"
    ]

    constructor: (@rs) ->
        @.viewComments = true
        @rs.history.get(@.type, @.id).then (history) =>
            @._getComments(history)
            @._getActivities(history)

    _getComments: (comments) ->
        @.comments = _.filter(comments, (item) -> item.comment != "")
        @.commentsNum = @.comments.length

    _getActivities: (activities) ->
        @.activities =  _.filter(activities, (item) -> Object.keys(item.values_diff).length > 0)
        @.activitiesNum = @.activities.length

    onActiveHistoryTab: (active) ->
        console.log "onActiveHistoryTab"
        @.viewComments = active

    onOrderComments: () ->
        console.log 'order-comments'

module.controller("HistorySection", HistorySectionController)