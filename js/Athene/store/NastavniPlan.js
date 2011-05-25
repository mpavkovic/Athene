Ext.define('Athene.store.NastavniPlan', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.NastavniPlan',
    proxy: {
        type: 'direct',
        directFn: NastavniPlan.getAll
    },
    sorters: [
        {
            property: 'opis'
        }
    ]
});