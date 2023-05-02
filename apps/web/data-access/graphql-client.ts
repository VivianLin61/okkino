import { getGraphqlClient } from '@okkino/web/data-access-graphql'
import { webEnv } from '../environments/environments'

const { api } = webEnv
export const gql = getGraphqlClient(api.gqlUrl)
