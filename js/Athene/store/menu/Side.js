Ext.define('Athene.store.menu.Side', {
    extend: 'Ext.data.TreeStore',
    model: 'Athene.models.MenuItem',
    /*proxy: {
        type: 'direct',
        directFn: Menu.side
    },*/
    root: {
        text: 'Izbornik',
        id: 'sidemenu',
        expanded: true
    },
    folderSort: true,
    sorters: [{
        property: 'text',
        direction: 'ASC'
    }],
});