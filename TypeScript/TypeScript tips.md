## Remapping types:

You can alter type keys with expressions:

```
export type PrefixKeyWithColon<Type> = {
    [Prop in keyof Type & string as `:${Prop}`]: Type[Prop]
}
```

And then apply that to a new type:

```
export type FooApiExpressionAttributeValues = Partial<PrefixKeyWithColon<FooApi>>
```

And with `FooApi` equaling this:

```
export interface FooApi {
    id: string
    createdAt: string
    updatedAt: string
    name: string
    slug: string
    description?: string
}
```

`FooApiExpressionAttributeValues` would compute to:

```
type FooApiExpressionAttributeValues {
    ":id": string | undefined
    ":createdAt": string | undefined
    ":updatedAt": string | undefined
    ":name": string | undefined
    ":slug": string | undefined
    ":description"?: string | undefined
}
```



Destructured object parameters:
```ts
const createMessageBodyFromIntermediates = async ({
    newProfile,
    oldProfile,
    messageType,
    actionBy = 'manual-network-call',
    tracingId,
    isCorrection,
    shadowMode = false,
}: {
    newProfile: ProfileIntermediate
    oldProfile: ProfileIntermediate | null
    messageType: string
    actionBy: string
    tracingId?: string
    isCorrection?: boolean
    shadowMode?: boolean
}): Promise<kafkaMessage> => {
```


