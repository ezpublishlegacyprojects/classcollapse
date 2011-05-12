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

<table class="special" cellspacing="0">
		
{section var=Attributes loop=$attributes sequence=array( bglight, bgdark )}
<tr>
    <th colspan="5">{$attributeNumber}.&nbsp;{$Attributes.item.nameList[$language_code]|wash}&nbsp;[{$Attributes.item.data_type.information.name|wash}]&nbsp;(id:{$Attributes.item.id})</th>
</tr>

<tr class="{$Attributes.sequence}">
    <td>
        <input type="hidden" name="ContentAttribute_id[]" value="{$Attributes.item.id}" />
        <input type="hidden" name="ContentAttribute_position[]" value="{$Attributes.item.placement}" />

        <div class="block">
            <h6>{'Name'|i18n( 'design/admin/class/view' )}:</h6>
            <p>{$Attributes.item.nameList[$language_code]|wash}</p>
        </div>
    </td>

    <td class="{$Attributes.sequence}">
        <div class="block">
            <h6>{'Identifier'|i18n( 'design/admin/class/view' )}:</h6>
            <p>{$Attributes.item.identifier|wash}</p>
        </div>
    </td>

    <td class="{$Attributes.sequence}">
        <div class="block">
            <h6>{'Category'|i18n( 'design/admin/class/view' )}:</h6>
                {if $Attributes.item.category|not}
                    <p>{'Default'|i18n( 'design/admin/class/edit' )} ({$attribute_categorys[ $attribute_default_category ]|wash})</p>
                {elseif is_set( $attribute_categorys[ $Attributes.item.category ] )}
                <p>{$attribute_categorys[ $Attributes.item.category ]|wash}</p>
            {else}
                <p>{$attribute_categorys[ $attribute_default_category ]|wash}</p>
            {/if}
        </div>
    </td>

    <td class="{$Attributes.sequence}">
        <div class="block">
            <h6>{'Description'|i18n( 'design/admin/class/view' )}:</h6>
            <p>{$Attributes.item.descriptionList[$language_code]|wash}</p>
        </div>
    </td>

    <td rowspan="2">

                <div class="block">
                  <h6>{'Flags'|i18n( 'design/admin/class/view' )}:</h6>
                </div>

        <div class="block">
            <p>{if $Attributes.item.is_required}{'Is required'|i18n( 'design/admin/class/view' )}{else}{'Is not required'|i18n( 'design/admin/class/view' )}{/if}</p>
        </div>

        {if $Attributes.item.data_type.is_indexable}
        <div class="block">
            <p>{if $Attributes.item.is_searchable}{'Is searchable'|i18n( 'design/admin/class/view' )}{else}{'Is not searchable'|i18n( 'design/admin/class/view' )}{/if}</p>
        </div>
        {else}
        <div class="block">
            <p>{'Is not searchable'|i18n( 'design/admin/class/view' )}</p>
        </div>
        {/if}

        {if $Attributes.item.data_type.is_information_collector}
        <div class="block">
            <p>{if $Attributes.item.is_information_collector}{'Collects information'|i18n( 'design/admin/class/view' )}{else}{'Does not collect information'|i18n( 'design/admin/class/view' )}{/if}</p>
        </div>
        {else}
        <div class="block">
            <p>{'Does not collect information'|i18n( 'design/admin/class/view' )}</p>
        </div>
        {/if}

        <div class="block">
            <p>{if or( $Attributes.item.can_translate|eq(0), $Attributes.item.data_type.properties.translation_allowed|not )}{'Translation is disabled'|i18n( 'design/admin/class/view' )}{else}{'Translation is enabled'|i18n( 'design/admin/class/view' )}{/if}</p>
        </div>
    </td>
</tr>

<tr class="{$Attributes.sequence}">
    <td colspan="4">
        {class_attribute_view_gui class_attribute=$Attributes.item}
    </td>
</tr>

{set $attributeNumber = $attributeNumber|sum(1)}

{/section}
</table>
</div>
</fieldset>
{/foreach}

{undef $attribute_categorys $attribute_default_category}

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

