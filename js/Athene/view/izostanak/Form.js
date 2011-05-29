Ext.define('Athene.view.izostanak.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.izostanakform',
    id: 'izostanakform',
    
    title: 'Novi izostanak',
    layout: 'fit',
    width: 320,
    height: 310,
    constrain: true,
       
    initComponent: function() {
	var me = this;
        this.items = [
            {
                xtype: 'form',
                bodyPadding: 5,
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                
                api: {
                    submit: Izostanak.save
                },
    
                items: [
{
                 xtype:'tabpanel'
                ,activeItem:0
                ,border:false
 
                // this line is necessary for anchoring to work at
                // lower level containers and for full height of tabs
                ,anchor:'100% 100%'
 
                // only fields from an active tab are submitted
                // if the following line is not persent
                ,deferredRender:false
 
                // tabs
                ,defaults:{
                    labelWidth:80
                    ,defaultType:'textfield'
                    ,bodyStyle:'padding:5px'
 
                    // as we use deferredRender:false we mustn't
                    // render tabs into display:none containers
                    ,hideMode:'offsets'
                }
                ,items:[{
                     title:'Opće informacije'
                    ,autoScroll:true
                    ,defaults:{anchor:'-20'}
 
                    // fields
                    ,items:[
						{
                        xtype: 'combo',
                        id: 'comboIzostanakUcenik',
                        store: 'Ucenik',
                        fieldLabel: 'Učenik',
                        displayField: 'prezime',
                        valueField: 'oib',
						name: 'ucenik_id'
						},
						{
                        xtype: 'combo',
                        id: 'comboIzostanakPredRazOdj',
                        store: 'PredmetRazrednogOdjeljenja',
                        fieldLabel: 'Predmet razrednog odjeljenja',
                        displayField: 'predmet_id',
                        valueField: 'id',
						name: 'predmet_id'
						},
						{
                        xtype: 'datefield',
                        name: 'datum',
                        fieldLabel: 'Datum',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
						},
						{
							xtype: 'combo',
							id: 'comboIzostanakOpravdano',
							fieldLabel: 'Opravdano',
							store: odabir_da_ne,
							queryMode: 'local',
							displayField: 'naziv',
							valueField: 'abbr',
							name: 'opravdano',
							maxLength: 11
						},
						{
                        xtype: 'textareafield',
                        name: 'opravdanje',
                        fieldLabel: 'Opravdanje',
                        allowBlank: false,
						grow: true,
						anchor: '100%'
						}
					]
                }
				]
            }
				],
                buttons: [
		    {
			text: 'Odustani',
			handler: function() {
			   me.close();
			}
		    },
                    {
                        text: 'Dodaj',
                        handler: function() {
                            this.up('form').getForm().submit();
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});