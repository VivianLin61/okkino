import { Test, TestingModule } from '@nestjs/testing'
import { PrismaService } from '@okkino/api/data-access-db'
import { HomeBlockService } from './home-block.service'

describe('HomeBlockService', () => {
  let service: HomeBlockService

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HomeBlockService, PrismaService]
    }).compile()

    service = module.get<HomeBlockService>(HomeBlockService)
  })

  it('should be defined', () => {
    expect(service).toBeDefined()
  })
})
