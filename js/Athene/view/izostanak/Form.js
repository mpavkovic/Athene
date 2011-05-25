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
                        valueField: 'id',
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
						xtype      : 'fieldcontainer',
						fieldLabel : 'Opravdano',
						defaultType: 'radiofield',
						defaults: {
							flex: 1
						},
						layout: 'hbox',
						items: [
							{
								boxLabel  : 'Da',
								name      : 'opravdano',
								inputValue: '1',
								id        : 'radio1'
							}, {
								boxLabel  : 'Ne',
								name      : 'opravdano',
								inputValue: '0',
								id        : 'radio2'
							}
						]
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
                },{
                     title:'Podaci o roditelju'
 
                    // fields
                    ,items:[{
                        // combo
                         name:'combo1'
                        ,fieldLabel:'Combo 1'
                        ,value:3
                        ,xtype:'combo'
                        ,store:[
                             [1, 'Item 1']
                            ,[2, 'Item 2']
                            ,[3, 'Item 3']
                            ,[4, 'Item 4']
                        ]
                        ,mode:'local'
                        ,triggerAction:'all'
                        ,hiddenName:'combo1'
                        ,width:120
                    },{
                        // date
                         name:'date1'
                        ,fieldLabel:'Date 1'
                        ,xtype:'datefield'
                        ,listeners:{
                            focus:{fn:function() {
                                if(this.menu == null){
                                    this.menu = new Ext.menu.DateMenu();
                                }
                                if(!this.menu.isVisible()) {
                                    this.onTriggerClick();
                                }
                            }}
                        }
                    }]
                },
				]
            }
				],
                buttons: [
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