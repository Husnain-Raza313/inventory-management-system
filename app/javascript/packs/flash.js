$(document).on('turbolinks:load', function() {
  $('#flashes').children('div')?.each((index, child)=>{
    toastr[$(child).attr('class')]($(child).html())
  })
})
