Ext.define('Athene.view.Viewport', {
   extend: 'Ext.container.Viewport',
   layout: {
        type: 'border',
        padding: 5
    },
    // Define regions
    items: [
         // Header
         {
            region: 'north',
            height: 35, 
            border: 0,
			layout: 'fit',
            padding: '0 0 5px 0',
            items: [
               {
                  xtype: 'toolbar',
				  addFill: true,
                  items: [
                    {
                        xtype: 'button',
						icon: 'img/icons/ucenici.png',
                        text: 'Učenici',
						id: 'openUcenikGrid',
						tooltip: {text:'Popis učenika'}
                    },
                    {
                        xtype: 'button',
						icon: 'img/icons/razredi.png',
                        text: 'Razredi',
						id: 'openRazredGrid',
						tooltip: {text:'Popis razreda'}
                    },
                    {
                        xtype: 'button',
						icon: 'img/icons/nastavni_sat.png',
                        text: 'Nastavni sat',
						id: 'openNastavniSatGrid',
						tooltip: {text:'Popis razreda'}
                    },
					{xtype: 'tbfill'},
                    {
                        xtype: 'button',
						icon: 'img/icons/help.png',
                        text: 'Pomoć',
						id: 'openPomocForm',
						tooltip: {text:'Kako koristiti aplikaciju'}
                    },
					'-',
					{
                        xtype: 'tbtext',
                        html: 'Ulogirani ste kao: <b>' + USERNAME + '</b>'
                     },
                     {
                        icon: 'img/icons/lock_open.png',
                        text: 'Odjava',
                        id: 'logout'
                     }
                  ]
               }
            ]
         },
         // Sidebar navigation
         {
            region: 'west',
            collapsible: true,
            title: 'Izbornik',
            width: 200,
            layout: 'fit',
            items: [
               {
                  xtype: 'sidemenu',
                  border: false // hide the unneccesary border
               }
            ]
        },
        {
            region: 'center',
            border: 0,
            bodyCls: 'workspace',
            id: 'workspace',
            items: [
               {
                  xtype: 'window',
                  autoShow: true,
                  title: 'Debug',
                  height: 200,
                  width: 500,
                  layout: 'fit',
                  id: 'debugWindow',
                  constrain: true,
                  listeners: {
                     afterrender: function(window) {
                        //console.log('Debug window rendered.');
                        window.alignTo(this, 'br', [1, 5]);
                     }
                  },
                  items: [
                     {
                        id: 'debugOutput',
                        title: false,
                        autoScroll: true,
                        bodyStyle: 'padding: 5px',
                        tpl: '{data}',
                        tplWriteMode: 'append'
                     }
                  ]
               }/*,
               {
                  //region: 'north',
                  xtype: 'popupmessage',
                  //style: 'position: absolute; right: 0;'
               }*/
            ]
        }
    ]
});