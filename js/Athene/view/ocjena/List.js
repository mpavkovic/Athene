Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.util.*',
    'Ext.Action'
]);
var EditAction = Ext.create('Ext.Action', {
	icon: 'img/icons/application_form_edit.png',
	text: 'Izmjeni',
	handler: function(widget, event) {
		var rec = grid.getSelectionModel().getSelection()[0];
		if (rec) {
			alert("Sell " + rec.get('ucenik_id'));
		} else {
			alert('Please select a company from the grid');
		}
	}
});
var DeleteAction = Ext.create('Ext.Action', {
	icon: 'img/icons/delete.png',
	text: 'Brisanje',
	handler: function(widget, event) {
		var rec = grid.getSelectionModel().getSelection()[0];
		if (rec) {
			alert("Buy " + rec.get('ucenik_id'));
		} else {
			alert('Please select a company from the grid');
		}
	}
});

var contextMenu = Ext.create('Ext.menu.Menu', {
	items: [
		EditAction,
		DeleteAction
	]
});

Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../Athene/js/ext/examples/ux');
Ext.require([
    'Ext.data.*',
    'Ext.grid.*',
    'Ext.util.*',
    'Ext.ux.ProgressBarPager'
]);

 // custom renderer function
function ocjena(val){
	if(val >= 3){
		return '<span style="color:green;">' + val + '</span>';
	}else if(val < 3){
		return '<span style="color:red;">' + val + '</span>';
	}
	return val;
}

Ext.define('Athene.view.ocjena.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.ocjenalist',
    id: 'ocjenalist',
    
    title: 'Popis Ocjena',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,

	tools: [
        {
            type: 'help',
            id: 'helpOcjena',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'ocjenagrid',
                store: 'Ocjena',
				viewConfig: {
					stripeRows: true,
					listeners: {
						itemcontextmenu: function(view, rec, node, index, e) {
							e.stopEvent();
							contextMenu.showAt(e.getXY());
							return false;
						}
					}
				},
                forceFit: true,
                columns: [
                    {
                        text: 'Ocjena',
						renderer: ocjena,
                        dataIndex: 'ocjena'
                    },
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Predmetna cjelina',
                        dataIndex: 'predmetna_cjelina_id'
                    },
                    {
                        text: 'Kategorija ocjena',
                        dataIndex: 'kategorija_ocjena_id'
                    },
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Opaska',
                        dataIndex: 'opaska'
                    },
		    {
                        xtype: 'actioncolumn',
                        width: 20,
                        items: [
                            {
                                icon: 'img/icons/application_form_edit.png',
                                tooltip: 'Izmijeni',
                                iconCls: 'editAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    var view = Ext.widget('ocjenaform');
                                    view.down('form').loadRecord(Ext.getStore('Ocjena').getAt(rowIndex));
                                    view.down('#formOcjenaSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Ocjena').getAt(rowIndex).data.ocjena;
                                    view.renderTo = '#ocjenalist';
                                    view.modal = true; // Make window modal so the list is inacesible
                                    view.show();
                                }
                            },
                            '-',
                            {
                                icon: 'img/icons/delete.png',
                                tooltip: 'Izbrisi',
                                iconCls: 'deleteAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    /*var userId = Ext.getStore('User').getAt(rowIndex).data.id;
                                    User.delete(userId, function(provider, response) {
                                        //console.log(provider, response);
                                        if(provider.success == true) {
                                            var sm = grid.getSelectionModel();
                                            grid.store.removeAt(rowIndex);
                                        }
                                    })*/
                                }
                            }
                        ]
                    }
                ]
            }
        ];
        
        this.dockedItems = [
            {
                xtype: 'toolbar',
                dock: 'top',
                items: [
                    {
                        xtype: 'button',
                        icon: 'img/icons/add.png',
                        text: 'Dodaj ocjenu', 
                        id: 'openOcjenaForm'
                    }
                ]
            },
	    {
                xtype: 'pagingtoolbar',
                store: 'Ocjena',
                dock: 'bottom',
                displayInfo: true,
				plugins: Ext.create('Ext.ux.ProgressBarPager', {})
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('ocjenalist', Athene.view.ocjena.List);