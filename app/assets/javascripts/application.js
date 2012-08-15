// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var count = 0;

$(document).ready(function() {
	$("#add_button").click(function(){
		parent = $(this).parent().parent();
		
		clone_class = parent.find(".clone")
		clone = clone_class.clone();
		new_item = clone.prependTo(clone_class);
		
		clear_form_elements(new_item);
		
		change_input_id_and_name(new_item);
		clone_class.removeClass("clone");
		clone_class.find("input").first().focus();
	});
});


function change_input_id_and_name(ele){

	$(ele).find(':input').each(function() {
		name_attr = $(this).attr("name");
		new_name_attr = name_attr.replace(/\d/, count + 1);
		
		id_attr = $(this).attr("id");
		new_id_attr = id_attr.replace(/\d/, count + 1);
		
		$(this).attr("name", new_name_attr);
		$(this).attr("id", new_id_attr);
	});
	count += 1;
}


function clear_form_elements(ele) {

    $(ele).find(':input').each(function() {
        switch(this.type) {
            case 'password':
            case 'select-multiple':
            case 'select-one':
            case 'text':
            case 'textarea':
                $(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;
        }
    });

}