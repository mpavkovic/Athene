Ext.define('Athene.store.Izostanak', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Izostanak',
    proxy: {
        type: 'direct',
        directFn: Izostanak.getAll
    },
    sorters: [
        {
            property: 'ucenik_id'
        }
    ]
});