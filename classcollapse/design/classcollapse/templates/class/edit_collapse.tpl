{*?template charset=UTF-8*}
{def $attributeNumber = 1}

{foreach $class_attributes_grouped_data_map as $attribute_group => $class_attributes_grouped}
	 <fieldset class="ezcca-collapsible">
	{if $attribute_group|ne( $attribute_default_category )}
	        <legend><a href="JavaScript:void(0);">{$attribute_categorys[$attribute_group]}</a></legend>
	{else}
	        <legend><a href="JavaScript:void(0);">{$attribute_default_category}</a></legend>
	{/if}
	<div class="ezcca-collapsible-fieldset-content">
	{set $attributes = $class_attributes_grouped}
	
<table id="ezcca-edit-list" class="special" cellspacing="0" summary="{'List of class attributes'|i18n( 'design/admin/class/edit' )}">
	<tbody>
	{section var=Attributes loop=$attributes sequence=array( bglight, bgdark )}
	
	{set $priority_value = $priority_value|sum( 10 )}
	
	<tr class="ezcca-edit-list-item {$Attributes.sequence}"{if $last_changed_id|eq( $Attributes.item.id )} id="LastChangedID"{/if}>
	<td>
	<table cellspacing="0" summary="{'Class attribute item'|i18n( 'design/admin/class/edit' )}">
	<tr>
	    <th class="tight"><input type="checkbox" name="ContentAttribute_id_checked[]" value="{$Attributes.item.id}" title="{'Select attribute for removal. Click the "Remove selected attributes" button to remove the selected attributes.'|i18n( 'design/admin/class/edit' )|wash}" /></th>
	    <th class="wide">{$attributeNumber}. {$Attributes.item.name|wash} [{$Attributes.item.data_type.information.name|wash}] (id:{$Attributes.item.id})</th>
	    <th class="tight">
	      <div class="listbutton">
	          <input type="image" src={'button-move_down.gif'|ezimage} alt="{'Down'|i18n( 'design/admin/class/edit' )}" name="MoveDown_{$Attributes.item.id}" title="{'Use the order buttons to set the order of the class attributes. The up arrow moves the attribute one place up. The down arrow moves the attribute one place down.'|i18n( 'design/admin/class/edit' )|wash}" />&nbsp;
	          <input type="image" src={'button-move_up.gif'|ezimage} alt="{'Up'|i18n( 'design/admin/class/edit' )}" name="MoveUp_{$Attributes.item.id}" title="{'Use the order buttons to set the order of the class attributes. The up arrow moves the attribute one place up. The down arrow moves the attribute one place down.'|i18n( 'design/admin/class/edit' )|wash}" />
	          <input size="2" maxlength="4" type="text" name="ContentAttribute_priority[]" value="{$priority_value}" />
	      </div>
	    </th>
	</tr>
	<tr>
	<td>&nbsp;</td>
	<!-- Attribute input Start -->
	<td colspan="2">
	<input type="hidden" name="ContentAttribute_id[]" value="{$Attributes.item.id}" />
	<input type="hidden" name="ContentAttribute_position[]" value="{$Attributes.item.placement}" />
	
	
	{* Attribute name. *}
	<div class="block">
	<label for="ContentAttribute_name_{$Attributes.item.id}">{'Name'|i18n( 'design/admin/class/edit' )}:</label>
	<input class="box" type="text" id="ContentAttribute_name_{$Attributes.item.id}" name="ContentAttribute_name[]" value="{$Attributes.item.nameList[$language_code]|wash}" title="{'Use this field to set the informal name of the attribute. This field can contain whitespaces and special characters.'|i18n( 'design/admin/class/edit' )|wash}" />
	</div>
	
	{* Attribute identifier. *}
	<div class="block">
	<label for="ContentAttribute_identifier_{$Attributes.item.id}">{'Identifier'|i18n( 'design/admin/class/edit' )}:</label>
	<input class="box" type="text" id="ContentAttribute_identifier_{$Attributes.item.id}" name="ContentAttribute_identifier[]" value="{$Attributes.item.identifier}" title="{'Use this field to set the internal name of the attribute. The identifier will be used in templates and in PHP code. Allowed characters are letters, numbers and underscores.'|i18n( 'design/admin/class/edit' )|wash}" />
	</div>
	
	{* Attribute description. *}
	<div class="block">
	<label for="ContentAttribute_description_{$Attributes.item.id}">{'Description'|i18n( 'design/admin/class/edit' )}:</label>
	<input class="box" type="text" id="ContentAttribute_description_{$Attributes.item.id}" name="ContentAttribute_description[]" value="{$Attributes.item.descriptionList[$language_code]|wash}" title="{'Use this field to set the informal description of the attribute. This field can contain whitespaces and special characters.'|i18n( 'design/admin/class/edit' )|wash}" />
	</div>
	
	<!-- Attribute input End -->
	
	<!-- Attribute flags Start -->
	<div class="block">
	
	{* Required. *}
	<div class="element">
	<label for="ContentAttribute_is_required_{$Attributes.item.id}">
	<input type="checkbox" id="ContentAttribute_is_required_{$Attributes.item.id}" name="ContentAttribute_is_required_checked[]" value="{$Attributes.item.id}"  {if $Attributes.item.is_required}checked="checked"{/if} title="{'Use this checkbox to specify whether the user should be forced to enter information into the attribute.'|i18n( 'design/admin/class/edit' )|wash}" />
	{'Required'|i18n( 'design/admin/class/edit' )}
	</label>
	</div>
	
	{* Searchable. *}
	<div class="element">
	<label for="ContentAttribute_is_searchable_{$Attributes.item.id}">
	{if $Attributes.item.data_type.is_indexable}
	<input type="checkbox" id="ContentAttribute_is_searchable_{$Attributes.item.id}" name="ContentAttribute_is_searchable_checked[]" value="{$Attributes.item.id}"  {if $Attributes.item.is_searchable}checked="checked"{/if} title="{'Use this checkbox to specify whether the contents of the attribute should be indexed by the search engine.'|i18n( 'design/admin/class/edit' )|wash}" />
	{else}
	<input type="checkbox" id="ContentAttribute_is_searchable_{$Attributes.item.id}" name="ContentAttribute_is_searchable_checked[]" value="" disabled="disabled" title="{'The <%datatype_name> datatype does not support search indexing.'|i18n( 'design/admin/class/edit',, hash( '%datatype_name', $Attributes.item.data_type.information.name ) )|wash}" />
	{/if}
	{'Searchable'|i18n( 'design/admin/class/edit' )}
	</label>
	</div>
	
	{* Information collector. *}
	<div class="element">
	<label for="ContentAttribute_is_information_collector_{$Attributes.item.id}">
	{if $Attributes.item.data_type.is_information_collector}
	<input type="checkbox" id="ContentAttribute_is_information_collector_{$Attributes.item.id}" name="ContentAttribute_is_information_collector_checked[]" value="{$Attributes.item.id}"  {if $Attributes.item.is_information_collector}checked="checked"{/if} title="{'Use this checkbox to specify whether the attribute should collect input from users.'|i18n( 'design/admin/class/edit' )|wash}" />
	{else}
	<input type="checkbox" id="ContentAttribute_is_information_collector_{$Attributes.item.id}" name="ContentAttribute_is_information_collector_checked[]" value="" disabled="disabled" title="{'The <%datatype_name> datatype cannot be used as an information collector.'|i18n( 'design/admin/class/edit',, hash( '%datatype_name', $Attributes.item.data_type.information.name ) )|wash}" />
	{/if}
	{'Information collector'|i18n( 'design/admin/class/edit' )}
	</label>
	<div class="break"></div>
	</div>
	
	
	{* Disable translation. *}
	<div class="element">
	<label for="ContentAttribute_can_translate_{$Attributes.item.id}">
	<input type="checkbox" id="ContentAttribute_can_translate_{$Attributes.item.id}" name="ContentAttribute_can_translate_checked[]" value="{$Attributes.item.id}" {if or( $Attributes.item.can_translate|eq(0), $Attributes.item.data_type.properties.translation_allowed|not )}checked="checked"{/if} {if $Attributes.item.data_type.properties.translation_allowed|not}disabled="disabled"{/if} title="{'Use this checkbox for attributes that contain non-translatable content.'|i18n( 'design/admin/class/edit' )|wash}" />
	{'Disable translation'|i18n( 'design/admin/class/edit' )}
	</label>
	</div>
	
	{* Category. *}
	<div class="element">
	<label for="ContentAttribute_category_{$Attributes.item.id}">
	<select id="ContentAttribute_category_{$Attributes.item.id}" name="ContentAttribute_category_select[]"  title="{'Use this category to group attributes together in edit interface, some categories might also be hidden in full view if they are for instance only meta attributes.'|i18n( 'design/admin/class/edit' )|wash}">
	    <option value="">{'Default'|i18n( 'design/admin/class/edit' )} ({$attribute_categorys[ $attribute_default_category ]|wash})</option>
	    {foreach $attribute_categorys as $categoryIdentifier => $categoryName}
	        <option value="{$categoryIdentifier|wash}"{if $categoryIdentifier|eq( $Attributes.item.category )} selected="selected"{/if}>{$categoryName|wash}</option>
	    {/foreach}
	</select>
	{'Category'|i18n( 'design/admin/class/edit' )}
	</label>
	</div>
	
	</div>
	
	{class_attribute_edit_gui class_attribute=$Attributes.item}
	
	</td>
	</tr>
	<!-- Attribute flags End -->
	</table>
	</td>
	</tr>
{set $attributeNumber = $attributeNumber|sum(1)}	
	{/section}
	</tbody>
	</table>
	</div>
    </fieldset>
{/foreach}

{undef $attribute_categorys $attribute_default_category $priority_value}


<script src={"javascript/classcollapse.js"|ezdesign} type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
var userKeyCode={ezini( 'KeyboardSettings', 'keycode', 'classcollapse.ini' )};

{literal}
$(document).keydown(function(event) {
handleAttributeSections(event.keyCode,userKeyCode);
});

jQuery(function( $ )
{
	{/literal}
	{run-once}
	{literal}
    $('fieldset.ezcca-collapsible legend a').click( function()
    {
                var container = $( this.parentNode.parentNode ), inner = container.find('div.ezcca-collapsible-fieldset-content');
                if ( container.hasClass('ezcca-collapsed') )
                {
                        container.removeClass('ezcca-collapsed');
                        inner.slideDown( 150 );
            	}
                else
                {
                        inner.slideUp( 150, function(){
                		$( this.parentNode ).addClass('ezcca-collapsed');
            });
        }
    });
    // We don't hide these by default for accebility reasons
    $('fieldset.ezcca-collapsible').addClass('ezcca-collapsed').find('div.ezcca-collapsible-fieldset-content').hide();
    {/literal}
    {/run-once}
    {literal}
});

{/literal}

</script>