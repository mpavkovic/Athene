Ext.define('Athene.store.Menu', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Menu',
    sorters: [
        {
            property: 'label'
        }
    ]
});