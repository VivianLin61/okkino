import React from 'react'
import { render } from '@testing-library/react'
import { gql } from '../data-access/graphql-client'
import Index from '../app/page'

gql.GetUsers = jest.fn().mockResolvedValue({ users: [] })

describe('Index', () => {
  it('should render successfully', async () => {
    const { baseElement } = render((await Index()) as unknown as React.ReactElement)
    expect(baseElement).toBeTruthy()
  })
})
