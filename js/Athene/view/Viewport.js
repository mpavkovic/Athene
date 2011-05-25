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
            //height: 100
            border: 0,
            padding: '0 0 5px 0',
            items: [
               {
                  xtype: 'toolbar',
                  items: [{
                        text: 'Test'
                     }, '->',
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
            id: 'workspace'
        }
    ]
});